package com.lol.banPick.dao;

import java.util.ArrayList;

import com.lol.banPick.dto.BanPickPhaseDto;
import com.lol.banPick.dto.MatchReatyDto;
import com.lol.banPick.dto.PlayerListDto;
import com.lol.banPick.dto.TeamListDto;

public interface IBPDao {
	ArrayList<TeamListDto> teamList();
	boolean checkTeamName(String teamName);
	boolean checkTeamInitial(String teamInitial);
	String teamRegister(String teamName, String teamInitial);
	ArrayList<PlayerListDto> playerInfo(String teamInitial);
	boolean checkPlayer(String[] player);
	void playerRegister(PlayerListDto playerListDto);
	boolean checkModify(PlayerListDto playerListDto);
	void deletePlayer(String selectTeamInitial);
	boolean checkPlayer(String[] player, String selectTeamInitial);
	ArrayList<TeamListDto> teamSearchList(String searchType, String search);
	String playerDelete(String nickName);
	void registerMatch(ArrayList<MatchReatyDto> dtos);
	int selectMatchNo();
	void registerBanPick(BanPickPhaseDto bppdto);
	ArrayList<BanPickPhaseDto> getBanPickRecord();
	ArrayList<MatchReatyDto> getMatchRecord();
	ArrayList<String> getPatchVersion();
}
