package net.playtogether.jpa.entity;
import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;


 
@Entity
@Table(name = "statistics")
@Setter
@Getter
public class Statistic implements Serializable {
 
    private static final long serialVersionUID = 1L;
     
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(optional = true)
    @JoinColumn(name = "sport")
    private Sport sport;
    
    @OneToOne(optional = true)
    @JoinColumn(name = "user")
    private User user;
}