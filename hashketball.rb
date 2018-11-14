# Write your code here!
require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {
          number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {
          number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {
          number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {
          number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        } #players hash
    }, #home
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {
          number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {
          number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {
          number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {
          number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      } #players hash
    } #away
  } #game hash
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |att, value|
      if att == :players
        value.each do |player, data|
          if player == player_name
            data.each do |key, stat|
              if key == :points
                return stat
              end #key if
            end #data each
          end #player if
        end #values each
      end #if attribute
    end #team_data each
  end #game_hash each
end #method

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |att, value|
      if att == :players
        value.each do |player, data|
          if player == player_name
            data.each do |key, stat|
              if key == :shoe
                return stat.to_i
              end #key if
            end #data each
          end #player if
        end #values each
      end #if attribute
    end #team_data each
  end #game_hash each
end #method

def team_colors(team)
  team_color_scheme = []
    if game_hash[:home][:team_name] == team
      team_color_scheme = game_hash[:home][:colors]
    elsif game_hash[:away][:team_name] == team
      team_color_scheme = game_hash[:away][:colors]
    else
    end #if
  return team_color_scheme
end #method

def team_names
  names_array = []
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :team_name
        names_array << value
      end #if
    end #each
  end #each
  return names_array
end #method

def player_numbers(team)
  jerseys=[]
  if game_hash[:home][:team_name] == team
      game_hash[:home].each do |k , v|
        if k == :players
          v.each do |names, stats|
            stats.each do |key, value|
                if key == :number
                  jerseys << value
                end #key if
            end #stat each
          end #v each
        end #player if
      end #home each
  elsif game_hash[:away][:team_name] == team
    game_hash[:away].each do |k, v|
      if k == :players
        v.each do |names, stats|
          stats.each do |key, value|
              if key == :number
                jerseys << value
              end #key if
            end #stat each
          end #v each
        end #player if
      end #away each
  else
  end #game_hash if
  return jerseys
end #method

def player_stats(player_name)
  if game_hash[:home][:players].include?(player_name)
    return game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players].include?(player_name)
    return game_hash[:away][:players][player_name]
  else
  end #home if
end #method

def big_shoe_rebounds
  player_data = []
  shoe_rebound = []
  game_hash.each do |loc, team_data|
    team_data.each do |k, v|
      if k == :players
        v.each do |names,stats|
            stats.each do |stat, value|
              if stat == :shoe
                player_data << value
              end #shoe stat if
              if stat == :rebounds
                player_data << value
              end #rebound stat if
            end #stats each
          end #v each
        end #k if
      end #team_data each
    end #game_hash each
  player_data
  shoe_rebound = player_data.each_slice(2).to_a
  shoe_rebound.sort!
  shoe_rebound.flatten!
  shoe_rebound[-1]
end #method
