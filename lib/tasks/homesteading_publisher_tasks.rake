namespace :hs do
  namespace :db do

    desc "HS: Load the seed data from db/seeds.rb, then your db/dev.seeds.rb"
    task :seed => ["rake:db:seed", "hs:db:seed:rename", "hs:db:seed:again", "hs:db:seed:rerename"]

    namespace :seed do
      desc "HS: Rename seeds.rb to production.seeds.rb & dev.seeds.rb to seeds.rb"
      task :rename do
        mv "db/seeds.rb",     "db/production.seeds.rb"
        mv "db/dev.seeds.rb", "db/seeds.rb"
      end

      desc "HS: Rename production back to seeds.rb & seeds.rb back to dev"
      task :rerename do
        mv "db/seeds.rb",            "db/dev.seeds.rb"
        mv "db/production.seeds.rb", "db/seeds.rb"
      end

      desc "HS: Seed again after db:seed-ing"
      task :again do
        Rake::Task["rake:db:seed"].execute
      end
    end

  end
end
