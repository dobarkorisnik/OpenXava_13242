package org.openxava.Ureduvanje.model;


import javax.persistence.*;

//http://localhost:8080/ProektFdiis
//app link testing

import org.openxava.annotations.*;

//@View(extendsView="DEFAULT")
@Entity
public class Account {

	@Id
	///Hidden
	@Required
	private Integer accountId;
	
	//ReadOnly
	@OneToOne
	@PrimaryKeyJoinColumn
	private Korisnik user;	

	//ReadOnly
	@Required
	@Stereotype("EMAIL")
	private String email;

	//ReadOnly
	@Required
	private String password;

	public Integer getAccountId() {
		return accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Korisnik getUser() {
		return user;
	}

	public void setUser(Korisnik user) {
		this.user = user;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}		
}
