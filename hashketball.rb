require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Auxiliary method creates a new array where each entry is a hash describing each player
def join_teams
  game_hash.values.map do |team_hash|
    team_hash[:players]
  end.flatten
end

# Auxiliary method returns a hash corresponding to a single player
def get_player(name)
  join_teams.find do |player|
    player[:player_name] == name 
  end 
end 

# Write code here
def num_points_scored(name)
  get_player(name)[:points]
end

def shoe_size(name)
  get_player(name)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |team, attributes|
    if attributes[:team_name] == team_name
      return attributes[:colors]
    end
  end
end

def team_names
  arr_names = []
  arr_names << game_hash[:home][:team_name]
  arr_names << game_hash[:away][:team_name]
  arr_names
end

# Define a helper method to extract player numbers given an array of hashes
# where each hash corresponds to a single player. 
def get_number(player)
  players = []
  (0...player.size).each do |i|
    players << player[i][:number]
  end
  players
end

def player_numbers(name)
  game_hash.each do |home_away, team|
    if team[:team_name] == name
      return get_number(team[:players])
    end
  end
end

def player_stats(name)
  get_player(name)
end


# Some more verbose code I used previously for largest_shoe_size
  # players_with_shoe = {}
  # game_hash.each do |home_away, team|
  #   team[:players].each do |individual_players|
  #     name = individual_players[:player_name]
  #     shoe = individual_players[:shoe]
  #     players_with_shoe[name] = shoe
  #   end
  # end
  # players_with_shoe.max_by{|player, shoe| shoe}[0]

# Return player name with largest shoe size
def largest_shoe_size
  biggest_shoe = join_teams.max_by do |player|
    player[:shoe]
  end 
  biggest_shoe[:player_name]
end

def big_shoe_rebounds
  player_stats(largest_shoe_size)[:rebounds]
end


# Some more verbose code I used previously for most_points_scored
  # players_with_points = {}
  # game_hash.each do |home_away, team|
  #   team[:players].each do |individual_players|
  #     name = individual_players[:player_name]
  #     points = individual_players[:points]
  #     players_with_points[name] = points
  #   end
  # end
  # players_with_points.max_by{|player, points| points}[0]

def most_points_scored
  most_points = join_teams.max_by do  |player|
    player[:points]
  end
  most_points[:player_name]
end

#Helper function is given a hash with all info on a team and returns sum of all points
def sum_points(team_hash)
  point_total = 0
  team_hash[:players].each do |individual_players|
    point_total += individual_players[:points]
  end
  point_total
end

def winning_team
  if sum_points(game_hash[:home]) > sum_points(game_hash[:away])
    return game_hash[:home][:team_name]
  end
  game_hash[:away][:team_name]
end

#Helper function returns array with all player names
def player_names
  join_teams.map do |player|
    player[:player_name]
  end
end

def player_with_longest_name
  names = player_names
  names.max {|a, b| a.length <=> b.length }
end

def most_steals
  steals = join_teams.max_by do |player|
    player[:steals]
  end 
  biggest_shoe[:steals]
end

def long_name_steals_a_ton?
  most_steals== player_with_longest_name
end
