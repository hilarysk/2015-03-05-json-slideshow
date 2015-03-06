DATABASE = SQLite3::Database.new("/Users/hilarysk/Code/2015-03-05-json-slideshow/database/slideshow.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS slides (id INTEGER PRIMARY KEY, title TEXT, slide_text TEXT, slide_order INTEGER NOT NULL UNIQUE)")