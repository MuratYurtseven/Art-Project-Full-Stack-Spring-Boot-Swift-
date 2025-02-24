package com.Murat.ArtProject.Services;

import com.Murat.ArtProject.Models.Artist;
import com.Murat.ArtProject.Repository.ArtistRepository;
import com.Murat.ArtProject.Repository.PaintingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArtistService {
    @Autowired
    private PaintingRepository paintingRepository;

    @Autowired
    private ArtistRepository artistRepository;

    public Artist getArtistById(int id) {
        return artistRepository.findById(id).orElse(null);
    }

    public List<Artist> getAllArtists() {
        return artistRepository.findAll();
    }
}
