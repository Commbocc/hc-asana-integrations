namespace :asana do

  desc "add user to teams" # rake asana:add_user_to_teams[985744629430233]
  task :add_user_to_teams, [:user_id] => :environment do |task, args|
    client = Project.asana_client
    teams = client.teams.find_by_organization(organization: ENV['ASANA_WORKSPACE_ID'])
    teams.each do |team|
      STDOUT.puts "Add user #{args.user_id} to team '#{team.name} - #{team.id}'? (y/n)"
      input = STDIN.gets.strip
      team.add_user(user: args.user_id) if input == 'y'
    end
  end

end
