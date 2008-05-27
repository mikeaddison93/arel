require File.join(File.dirname(__FILE__), '..', '..', '..', '..', '..', 'spec_helper')

module Arel
  describe Where do
    before do
      @relation = Table.new(:users)
      @predicate = @relation[:id].eq(1)
    end
    
    describe '#to_sql' do
      describe 'when given a predicate' do
        it "manufactures sql with where clause conditions" do
          Where.new(@relation, @predicate).to_sql.should be_like("
            SELECT `users`.`id`, `users`.`name`
            FROM `users`
            WHERE `users`.`id` = 1
          ")
        end
      end
      
      describe 'when given a string' do
        it "passes the string through to the where clause" do
          Where.new(@relation, 'asdf').to_sql.should be_like("
            SELECT `users`.`id`, `users`.`name`
            FROM `users`
            WHERE asdf
          ")
        end
      end
    end
  end
end