package org.openxava.Ureduvanje.model;

import java.util.*;

import javax.persistence.*;

import org.openxava.annotations.*;

//http://localhost:8080/ProektFdiis
//app link testing

@Entity
public class Trud {
	
	@Id @Required
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer workId;
	
	@Required
	private String title;
	
	@Required
	private String dateOfMaking;
	
	@ManyToMany(mappedBy="works")
    private Set<Korisnik> users = new HashSet<Korisnik>();

	public Integer getWorkId() {
		return workId;
	}

	public void setWorkId(Integer workId) {
		this.workId = workId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDateOfMaking() {
		return dateOfMaking;
	}

	public void setDateOfMaking(String dateOfMaking) {
		this.dateOfMaking = dateOfMaking;
	}

	public Set<Korisnik> getUsers() {
		return users;
	}

	public void setUsers(Set<Korisnik> users) {
		this.users = users;
	}
}
