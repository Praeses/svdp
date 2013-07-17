class FullTextSearchIndexes < ActiveRecord::Migration
  def change
    execute "
    CREATE INDEX ON email_logs USING GIN(to_tsvector('english', subject));

    CREATE INDEX ON addresses USING GIN(to_tsvector('english', line_1)
    CREATE INDEX ON addresses USING GIN(to_tsvector('english', line_2)
    CREATE INDEX ON addresses USING GIN(to_tsvector('english', line_3)
    CREATE INDEX ON addresses USING GIN(to_tsvector('english', city)
    CREATE INDEX ON addresses USING GIN(to_tsvector('english', state)
    CREATE INDEX ON addresses USING GIN(to_tsvector('english', zip)


    CREATE INDEX ON families USING GIN(to_tsvector('english', name)

    CREATE INDEX ON people USING GIN(to_tsvector('english', first_name)
    CREATE INDEX ON people USING GIN(to_tsvector('english', last_name)
    CREATE INDEX ON people USING GIN(to_tsvector('english', phone)
    CREATE INDEX ON people USING GIN(to_tsvector('english', ssn)
    "
  end
end
