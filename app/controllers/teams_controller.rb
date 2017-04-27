require 'httparty'
require 'json'
class TeamsController < ApplicationController

  def index
    # @teams = Team.query_db

    url = "http://stats.nba.com/stats/leaguedashteamstats?Conference=&DateFrom=&DateTo=&Division=&GameScope=&GameSegment=&LastNGames=0&LeagueID=00&Location=&MeasureType=Opponent&Month=0&OpponentTeamID=0&Outcome=&PORound=0&PaceAdjust=N&PerMode=PerGame&Period=0&PlayerExperience=&PlayerPosition=&PlusMinus=N&Rank=N&Season=2016-17&SeasonSegment=&SeasonType=Playoffs&ShotClockRange=&StarterBench=&TeamID=0&VsConference=&VsDivision="
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
    #
    #
    body = JSON.parse(response.body)

    @teams = []

    body["resultSets"].each do |set|
      set["rowSet"].each do |team|
        # puts team[set["headers"].index("TEAM_ID")]
        # puts team[set["headers"].index("TEAM_NAME")]

        # [ {name: 'Warriors'} , {name: 'Bulls'} ]

        team_hash = {}

        team_hash[:id] = team[set["headers"].index("TEAM_ID")]
        team_hash[:name] = team[set["headers"].index("TEAM_NAME")]
        team_hash[:wins] = team[set["headers"].index("W")]
        team_hash[:losses] = team[set["headers"].index("L")]
        team_hash[:games] = team[set["headers"].index("GP")]
        team_hash[:winning_percentage] = team[set["headers"].index("W_PCT")]
        team_hash[:minutes] = team[set["headers"].index("MIN")]
        team_hash[:opp_fgm] = team[set["headers"].index("OPP_FGM")]
        team_hash[:opp_fga] = team[set["headers"].index("OPP_FGA")]
        team_hash[:opp_fg_percentage] = team[set["headers"].index("OPP_FG_PCT")]
        team_hash[:opp_three_pt_a] = team[set["headers"].index("OPP_FG3M")]
        team_hash[:opp_three_pt_m] = team[set["headers"].index("OPP_FG3A")]
        team_hash[:opp_three_pt_percentage] = team[set["headers"].index("OPP_FG3_PCT")]
        team_hash[:opp_ftm] = team[set["headers"].index("OPP_FTM")]
        team_hash[:opp_fta] = team[set["headers"].index("OPP_FTA")]
        team_hash[:opp_ft_percentage] = team[set["headers"].index("OPP_FT_PCT")]
        team_hash[:opp_oreb] = team[set["headers"].index("OPP_OREB")]
        team_hash[:opp_dreb] = team[set["headers"].index("OPP_DREB")]
        team_hash[:opp_reb] = team[set["headers"].index("OPP_REB")]
        team_hash[:opp_assists] = team[set["headers"].index("OPP_AST")]
        team_hash[:opp_tov] = team[set["headers"].index("OPP_TOV")]
        team_hash[:opp_stl] = team[set["headers"].index("OPP_STL")]
        team_hash[:opp_blk] = team[set["headers"].index("OPP_BLK")]
        team_hash[:opp_blka] = team[set["headers"].index("OPP_BLKA")]
        team_hash[:opp_personal_fouls] = team[set["headers"].index("OPP_PF")]
        team_hash[:opp_personal_fouls_drawn] = team[set["headers"].index("OPP_PFD")]
        team_hash[:opp_points] = team[set["headers"].index("OPP_PTS")]
        team_hash[:plus_minus] = team[set["headers"].index("PLUS_MINUS")]
        team_hash[:games_played_rank] = team[set["headers"].index("GP_RANK")]
        team_hash[:wins_rank] = team[set["headers"].index("W_RANK")]
        team_hash[:loss_rank] = team[set["headers"].index("L_RANK")]
        team_hash[:winning_percentage_rank] = team[set["headers"].index("W_PCT_RANK")]
        team_hash[:min_rank] = team[set["headers"].index("MIN_RANK")]
        team_hash[:opp_fgm_rank] = team[set["headers"].index("OPP_FGM_RANK")]
        team_hash[:opp_fga_rank] = team[set["headers"].index("OPP_FGA_RANK")]
        team_hash[:opp_fg_pct_rank] = team[set["headers"].index("OPP_FG_PCT_RANK")]
        team_hash[:opp_three_pt_m_rank] = team[set["headers"].index("OPP_FG3M_RANK")]
        team_hash[:opp_three_pt_a_rank] = team[set["headers"].index("OPP_FG3A_RANK")]
        team_hash[:opp_three_pt_percentage_rank] = team[set["headers"].index("OPP_FG3_PCT_RANK")]
        team_hash[:opp_ftm_rank] = team[set["headers"].index("OPP_FTM_RANK")]
        team_hash[:opp_fta_rank] = team[set["headers"].index("OPP_FTA_RANK")]
        team_hash[:opp_ft_percentage_rank] = team[set["headers"].index("OPP_FT_PCT_RANK")]
        team_hash[:opp_oreb_rank] = team[set["headers"].index("OPP_OREB_RANK")]
        team_hash[:opp_dreb_rank] = team[set["headers"].index("OPP_DREB_RANK")]
        team_hash[:opp_ast_rank] = team[set["headers"].index("OPP_AST_RANK")]
        team_hash[:opp_tov_rank] = team[set["headers"].index("OPP_TOV_RANK")]
        team_hash[:opp_stl_rank] = team[set["headers"].index("OPP_STL_RANK")]
        team_hash[:opp_blk_rank] = team[set["headers"].index("OPP_BLK_RANK")]
        team_hash[:opp_blka_rank] = team[set["headers"].index("OPP_BLKA_RANK")]
        team_hash[:opp_pf_rank] = team[set["headers"].index("OPP_PF_RANK")]
        team_hash[:opp_pfd_rank] = team[set["headers"].index("OPP_PFD_RANK")]
        team_hash[:opp_pfd_rank] = team[set["headers"].index("OPP_PFD_RANK")]
        team_hash[:opp_pts_rank] = team[set["headers"].index("OPP_PTS_RANK")]
        team_hash[:plus_minus_rank] = team[set["headers"].index("PLUS_MINUS_RANK")]

        @teams.push(team_hash)
      end
    end

  end


end
