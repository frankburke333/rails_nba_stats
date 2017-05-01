require 'httparty'
require 'json'


class PlayerScoringPlayoffsController < ApplicationController

  def index


    url = "http://stats.nba.com/stats/leaguedashplayerstats?College=&Conference=&Country=&DateFrom=&DateTo=&Division=&DraftPick=&DraftYear=&GameScope=&GameSegment=&Height=&LastNGames=0&LeagueID=00&Location=&MeasureType=Scoring&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Playoffs&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision=&Weight="
    headers = {
      "DNT" => '1',
      "Accept-Encoding" => 'gzip, deflate, sdch',
      "Accept-Language" => 'en',
      "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36",
      "Accept" => "*/*",
      "Referer" => "http://stats.nba.com/",
      "Connection" => "keep-alive"
    }

    response = HTTParty.get(url, headers: headers)
  # puts response.body, response.code, response.message, response.headers.inspect
  # #
  # #
  body = JSON.parse(response.body)

  @players = []

  body["resultSets"].each do |set|
    set["rowSet"].each do |team|
      # puts team[set["headers"].index("TEAM_ID")]
      # puts team[set["headers"].index("TEAM_NAME")]

      player_hash = {}


      player_hash[:id] = player_id = team[set["headers"].index("PLAYER_ID")]
      player_hash[:name] = team[set["headers"].index("PLAYER_NAME")]
      player_hash[:team_id] = team[set["headers"].index("TEAM_ID")]
      player_hash[:team_abbreviation] = team[set["headers"].index("TEAM_ABBREVIATION")]
      player_hash[:age] = team[set["headers"].index("AGE")]
      player_hash[:games_played] = team[set["headers"].index("GP")]
      player_hash[:wins] = team[set["headers"].index("W")]
      player_hash[:losses] = team[set["headers"].index("L")]
      player_hash[:winning_percentage] = team[set["headers"].index("W_PCT")]
      player_hash[:minutes] = team[set["headers"].index("MIN")]
      player_hash[:pct_fga_2pt] = team[set["headers"].index("PCT_FGA_2PT")]
      player_hash[:pct_fga_3pt] = team[set["headers"].index("PCT_FGA_3PT")]
      player_hash[:pct_pts_2pt] = team[set["headers"].index("PCT_PTS_2PT")]
      player_hash[:pct_pts_2pt_mr] = team[set["headers"].index("PCT_PTS_2PT_MR")]
      player_hash[:pct_pts_3pt] = team[set["headers"].index("PCT_PTS_3PT")]
      player_hash[:pct_pts_fb] = team[set["headers"].index("PCT_PTS_FB")]
      player_hash[:pct_pts_ft] = team[set["headers"].index("PCT_PTS_FT")]
      player_hash[:pct_pts_off_tov] = team[set["headers"].index("PCT_PTS_OFF_TOV")]
      player_hash[:pct_pts_paint] = team[set["headers"].index("PCT_PTS_PAINT")]
      player_hash[:pct_ast_2pm] = team[set["headers"].index("PCT_AST_2PM")]
      player_hash[:pct_uast_2pm] = team[set["headers"].index("PCT_UAST_2PM")]
      player_hash[:pct_ast_3pm] = team[set["headers"].index("PCT_AST_3PM")]
      player_hash[:pct_uast_3pm] = team[set["headers"].index("PCT_UAST_3PM")]
      player_hash[:pct_ast_fgm] = team[set["headers"].index("PCT_AST_FGM")]
      player_hash[:pct_uast_fgm] = team[set["headers"].index("PCT_UAST_FGM")]
      player_hash[:games_played_rank] = team[set["headers"].index("GP_RANK")]
      player_hash[:wins_rank] = team[set["headers"].index("W_RANK")]
      player_hash[:loss_rank] = team[set["headers"].index("L_RANK")]
      player_hash[:winning_percentage_rank] = team[set["headers"].index("W_PCT_RANK")]
      player_hash[:min_rank] = team[set["headers"].index("MIN_RANK")]
      player_hash[:pct_fga_2pt_rank] = team[set["headers"].index("PCT_FGA_2PT_RANK")]
      player_hash[:pct_fga_3pt_rank] = team[set["headers"].index("PCT_FGA_3PT_RANK")]
      player_hash[:pct_pts_2pt_rank] = team[set["headers"].index("PCT_PTS_2PT_RANK")]
      player_hash[:pct_pts_2pt_mr_rank] = team[set["headers"].index("PCT_PTS_2PT_MR")]
      player_hash[:pct_pts_3pt_rank] = team[set["headers"].index("PCT_PTS_3PT_RANK")]
      player_hash[:pct_pts_fb_rank] = team[set["headers"].index("PCT_PTS_FB_RANK")]
      player_hash[:pct_pts_ft_rank] = team[set["headers"].index("PCT_PTS_FT_RANK")]
      player_hash[:pct_pts_off_tov_rank] = team[set["headers"].index("PCT_PTS_OFF_TOV_RANK")]
      player_hash[:pct_pts_paint_rank] = team[set["headers"].index("PCT_PTS_PAINT_RANK")]
      player_hash[:pct_ast_2pm_rank] = team[set["headers"].index("PCT_AST_2PM_RANK")]
      player_hash[:pct_uast_2pm_rank] = team[set["headers"].index("PCT_UAST_2PM_RANK")]
      player_hash[:pct_ast_3pm_rank] = team[set["headers"].index("PCT_AST_3PM_RANK")]
      player_hash[:pct_uast_3pm_rank] = team[set["headers"].index("PCT_UAST_3PM_RANK")]
      player_hash[:pct_ast_fgm_rank] = team[set["headers"].index("PCT_AST_FGM_RANK")]
      player_hash[:pct_uast_fgm_rank] = team[set["headers"].index("PCT_UAST_FGM_RANK")]

      @players.push(player_hash)


      end

    end
  end

end
