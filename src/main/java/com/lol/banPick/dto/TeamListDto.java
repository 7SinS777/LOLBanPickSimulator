package com.lol.banPick.dto;

public class TeamListDto {
	private String teamName;
	private String teamInitial;
	
	public TeamListDto() {
		super();
	}
	
	public TeamListDto(String teamName, String teamInitial) {
		super();
		this.teamName = teamName;
		this.teamInitial = teamInitial;
	}
	
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamInitial() {
		return teamInitial;
	}
	public void setTeamInitial(String teamInitial) {
		this.teamInitial = teamInitial;
	}
}
