class AddActorMoviesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :age
      t.timestamps
    end

    create_table :actor_movies do |t|
      t.references :movie, foreign_key: true
      t.references :actor, foreign_key: true
    end
  end
end
