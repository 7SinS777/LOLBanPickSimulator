package com.lol.banPick.dto;

public class PlayerListDto {
	private String nickName;
	private String teamInitial;
	private String position;
	public PlayerListDto() {
		super();
	}
	
	public PlayerListDto(String nickName, String teamInitial, String position) {
		super();
		this.nickName = nickName;
		this.teamInitial = teamInitial;
		this.position = position;
	}
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTeamInitial() {
		return teamInitial;
	}
	public void setTeamInitial(String teamInitial) {
		this.teamInitial = teamInitial;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
