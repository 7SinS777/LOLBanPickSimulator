package com.lol.banPick.dao;

import java.util.ArrayList;
import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.lol.banPick.dto.BanPickPhaseDto;
import com.lol.banPick.dto.MatchReatyDto;
import com.lol.banPick.dto.PlayerListDto;
import com.lol.banPick.dto.TeamListDto;

public class BPDao implements IBPDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<TeamListDto> teamList() {
		ArrayList<TeamListDto> dtos = (ArrayList)sqlSession.selectList("teamList");
		return dtos;
	}
	@Override
	public boolean checkTeamName(String teamName) {
		ArrayList<TeamListDto> dtos = (ArrayList)sqlSession.selectList("teamList");
		for(int i=0; i<dtos.size(); i++) {
			if(teamName.equals(dtos.get(i).getTeamName())) {
				return true;
			}
		}
		return false;
	}
	@Override
	public boolean checkTeamInitial(String teamInitial) {
		ArrayList<TeamListDto> dtos = (ArrayList)sqlSession.selectList("teamList");
		for(int i=0; i<dtos.size(); i++) {
			if(teamInitial.equals(dtos.get(i).getTeamInitial())) {
				return true;
			}
		}
		return false;
	}
	@Override
	public String teamRegister(String teamName, String teamInitial) {
		TeamListDto dto = new TeamListDto(teamName, teamInitial);
		sqlSession.insert("teamRegister", dto);
		return "register-success";
	}
	@Override
	public ArrayList<PlayerListDto> playerInfo(String teamInitial) {
		ArrayList<PlayerListDto> dtos = (ArrayList)sqlSession.selectList("playerInfo", teamInitial);
		return dtos;
	}
	@Override
	public boolean checkPlayer(String[] player) {
		ArrayList<String> players = (ArrayList)sqlSession.selectList("checkPlayer");
		for(int i=0; i<player.length; i++) {
			for(int j=0; j<players.size(); j++) {
				if(players.get(j).equals(player[i])) {
					return true;
				}
			}
		}
		return false;
	}
	@Override
	public void playerRegister(PlayerListDto playerListDto) {
		sqlSession.insert("playerRegister", playerListDto);
	}
	@Override
	public boolean checkModify(PlayerListDto playerListDto) {
		String nickName = playerListDto.getNickName();
		PlayerListDto dto = sqlSession.selectOne("checkModify", nickName);
		if(dto == null) {
			return true;
		}
		if(dto.getPosition().equals(playerListDto.getPosition()) && dto.getTeamInitial().equals(playerListDto.getTeamInitial())) {
			return false;
		}
		return true;
	}
	@Override
	public void deletePlayer(String selectTeamInitial) {
		sqlSession.delete("deletePlayer", selectTeamInitial);
	}
	@Override
	public boolean checkPlayer(String[] player, String selectTeamInitial) {
		ArrayList<String> players = (ArrayList)sqlSession.selectList("checkPlayer2", selectTeamInitial);
		for(int i=0; i<player.length; i++) {
			for(int j=0; j<players.size(); j++) {
				if(players.get(j).equals(player[i])) {
					return true;
				}
			}
		}
		return false;
	}
	@Override
	public ArrayList<TeamListDto> teamSearchList(String searchType, String search) {
		ArrayList<TeamListDto> dto = new ArrayList<TeamListDto>();
		if(searchType.equals("teamInitial")) {
			dto = (ArrayList)sqlSession.selectList("searchTeamInitial", search);
		} else {
			dto = (ArrayList)sqlSession.selectList("searchTeamName", search);
		}
		return dto;
	}
	@Override
	public String playerDelete(String nickName) {
		int res = sqlSession.delete("playerDelete", nickName);
		if(res > 0) {
			return "delete-success";
		} else {
			return "delete-failed";
		}
	}
	@Override
	public void registerMatch(ArrayList<MatchReatyDto> dtos) {
		for(int i=0; i<dtos.size(); i++) {
			MatchReatyDto dto = dtos.get(i);
			sqlSession.insert("registerMatch", dto);
		}
	}
	@Override
	public int selectMatchNo() {
		int matchNo = 0;
		if(sqlSession.selectOne("selectMatchNo") == null) {
			matchNo = 0;
		} else {
			matchNo = sqlSession.selectOne("selectMatchNo");
		}
		return matchNo;
	}
	@Override
	public void registerBanPick(BanPickPhaseDto bppdto) {
		sqlSession.insert("registerBanPick", bppdto);
	}
	@Override
	public ArrayList<BanPickPhaseDto> getBanPickRecord() {
		ArrayList<BanPickPhaseDto> dto = (ArrayList)sqlSession.selectList("getBanPickRecord");
		return dto;
	}
	@Override
	public ArrayList<MatchReatyDto> getMatchRecord() {
		ArrayList<MatchReatyDto> dtos = (ArrayList)sqlSession.selectList("getMatchRecord");
		return dtos;
	}
	@Override
	public ArrayList<String> getPatchVersion() {
		ArrayList<String> patchList = (ArrayList)sqlSession.selectList("getPatchVersion");
		return patchList;
	}
}
