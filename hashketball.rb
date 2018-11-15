# Write your code here!
require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" =>{
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player) #good
  foo = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            if data_item[0] == player
              foo = data_item[1][:points]
            end
          end
        end
      end
  end
  foo
end

def shoe_size(player) #good
  foo = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            if data_item[0] == player
              foo = data_item[1][:shoe]
            end
          end
        end
      end
  end
  foo
end

def team_colors(team) ##good
  foo = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      foo = team_data[:colors]
    end
  end
  foo
end

def team_names ####GOOD
  foo = []
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :team_name
          foo << data
        end
    end
  end
  foo
end

def player_numbers(team) #good
  #"brooklyn nets" returns (brooklyn_numbers)
  foo = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          foo << data_item[1][:number]
        end
      end
    end
    end
  end
  foo
end

def player_stats(player)
  #"jeff adrien" returns (jeff_stats)
  foo = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item|
          if data_item[0] == player
          foo = data_item[1]
          end
        end
      end
    end
  end
  foo
end

def big_shoe_rebounds
  #returns number of rebounds of player wiht biggest shoe shoe_size
  #big_shoe_rebounds = 12
  foo = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
            if data_item[0] == player_with_biggest_shoe()
              foo = data_item[1][:rebounds]
            end
          end
        end
      end
  end
  foo
end

def player_with_biggest_shoe
  foo = 0
  bar = nil
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_item|
              if data_item[1][:shoe] > foo
                foo = data_item[1][:shoe]
                bar = data_item[0]
            end
          end
        end
      end
    end
  bar
end
