package com.Murat.ArtProject.Repository;

import com.Murat.ArtProject.Models.Artist;
import com.Murat.ArtProject.Models.Painting;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArtistRepository extends JpaRepository<Artist,Integer> {
}
