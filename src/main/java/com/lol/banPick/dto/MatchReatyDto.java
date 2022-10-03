package com.lol.banPick.dto;

public class MatchReatyDto {
	private int matchNo;
	private String camp;
	private String position;
	private String nickName;
	private String champion;
	private String matchResult;
	private String patchVersion;
	private String teamInitial;
	public MatchReatyDto() {
		super();
	}
	
	public MatchReatyDto(int matchNo, String camp, String position, String nickName, String champion, String matchResult,
			String patchVersion, String teamInitial) {
		super();
		this.matchNo = matchNo;
		this.camp = camp;
		this.position = position;
		this.nickName = nickName;
		this.champion = champion;
		this.matchResult = matchResult;
		this.patchVersion = patchVersion;
		this.teamInitial = teamInitial;
	}
	public MatchReatyDto(int matchNo, String camp, String position, String nickName, String patchVersion, String teamInitial) {
		super();
		this.matchNo = matchNo;
		this.camp = camp;
		this.position = position;
		this.nickName = nickName;
		this.patchVersion = patchVersion;
		this.teamInitial = teamInitial;
	}
	
	public int getMatchNo() {
		return matchNo;
	}
	public void setMatchNo(int matchNo) {
		this.matchNo = matchNo;
	}
	public String getCamp() {
		return camp;
	}
	public void setCamp(String camp) {
		this.camp = camp;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getChampion() {
		return champion;
	}
	public void setChampion(String champion) {
		this.champion = champion;
	}
	public String getMatchResult() {
		return matchResult;
	}
	public void setMatchResult(String matchResult) {
		this.matchResult = matchResult;
	}
	public String getPatchVersion() {
		return patchVersion;
	}
	public void setPatchVersion(String patchVersion) {
		this.patchVersion = patchVersion;
	}
	public String getTeamInitial() {
		return teamInitial;
	}
	public void setTeamInitial(String teamInitial) {
		this.teamInitial = teamInitial;
	}

	@Override
	public String toString() {
		return "MatchReatyDto [matchNo=" + matchNo + ", camp=" + camp + ", position=" + position + ", nickName="
				+ nickName + ", champion=" + champion + ", matchResult=" + matchResult + ", patchVersion="
				+ patchVersion + ", teamInitial=" + teamInitial + "]";
	}
}
