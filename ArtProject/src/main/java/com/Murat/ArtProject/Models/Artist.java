package com.Murat.ArtProject.Models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.lang.reflect.Array;
import java.util.Date;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Artist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ArtistId;
    private String name;
    private String surname;
    private String profileImageUrl;
    private String aboutLife;
    private Date bornTime;
    private Date deadTime;
}

