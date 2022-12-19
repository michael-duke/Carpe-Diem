require 'rails_helper'

RSpec.describe GroupExpense, type: :model do
  before :each do
    @user = User.create(name: 'Mace Windu')
    @category = Group.create(author: @user, name: 'Games', icon: 'fas fa-gamepad')
    @transaction = Expense.create(author: @user, name: 'Star Wars: BattleFront', amount: 49.99)
    @category_transaction = GroupExpense.new(group: @category, expense: @transaction)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@category_transaction).to be_valid
    end

    it 'is valid without a group_id' do
      @category_transaction.group_id = nil
      expect(@category_transaction).to_not be_valid
    end

    it 'is valid without an expense_id' do
      @category_transaction.expense_id = nil
      expect(@category_transaction).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to recipe' do
      assoc = GroupExpense.reflect_on_association(:group)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      assoc = GroupExpense.reflect_on_association(:expense)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
