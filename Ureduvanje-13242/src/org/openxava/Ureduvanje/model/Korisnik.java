package org.openxava.Ureduvanje.model;

import java.util.*;

import javax.persistence.*;

import org.openxava.annotations.*;

import data.*;

//http://localhost:8080/ProektFdiis
//app link testing

@Entity
public class Korisnik {
	
	@Id @Required
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer userId;
	
	@Required
	private String firstName; 
	
	@Required
	private String lastName; 
	
	@Required
	private Gender gender; 
	
	@Required
	private String placeOfBirth;
	
	@Required
	private String email;
	
	@ManyToMany
	@JoinTable(name="User_Work", joinColumns={@JoinColumn(name="userId")},inverseJoinColumns={@JoinColumn(name="workId")})
	private Set<Trud> works = new HashSet<Trud>();
	
	@ReadOnly
	@OneToOne(mappedBy="user", cascade=CascadeType.REMOVE)  // Automatically delete account
	private Account account;

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getPlaceOfBirth() {
		return placeOfBirth;
	}

	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Trud> getWorks() {
		return works;
	}

	public void setWorks(Set<Trud> works) {
		this.works = works;
	}
	
	
}
