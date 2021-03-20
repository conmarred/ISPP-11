package net.playtogether.jpa.entity;


import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;


 
@Entity
@Table(name = "meetings")
@Getter

public class Meeting extends NamedEntity {
 
    @NotNull
    @Column(name = "address")
    private String address;

    @Column(name = "city")
    private String city;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @Column(name = "date")
    private LocalDateTime date;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "meeting")
    private List<User> participants;

    @Column(name = "description")
    private String description;

    @ManyToOne(optional = false)
    private Sport sport;
    
    public Meeting(int id, String address, String city, LocalDateTime date, List<User> participants, String description, Sport sport) {
		this.id=id;
		this.address=address;
		this.city=city;
		this.date=date;
		this.participants=participants;
		this.description=description;
		this.sport=sport;
	}
    
    public Meeting () {
    	
    }

    
    
}
