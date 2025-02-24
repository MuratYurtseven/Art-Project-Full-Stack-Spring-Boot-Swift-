package com.Murat.ArtProject.Services;

import com.Murat.ArtProject.Models.Painting;
import com.Murat.ArtProject.Repository.ArtistRepository;
import com.Murat.ArtProject.Repository.PaintingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaintingService {

    @Autowired
    private PaintingRepository paintingRepository;

    @Autowired
    private ArtistRepository artistRepository;

    public List<Painting> getPopularPaintings() {
        return paintingRepository.findTop15ByOrderByPopularityDesc();
    }

    public Page<Painting> getAllPaintings(Pageable pageable) {
        return paintingRepository.findAll(pageable);
    }

    public List<Painting> searchPaintings(String keyword) {
        return paintingRepository.searchPaintings(keyword);
    }

    public List<Painting> getRecommendedPaintings() {
        return paintingRepository.findTop15ByOrderByRecommendedRateDesc();
    }

    public List<Painting> getMostLikedPaintings() {
        return paintingRepository.findTop15ByOrderByLikedRateDesc();
    }

    public List<Painting> getMostVisitedPaintings() {
        return paintingRepository.findTop15ByOrderByVisitedRateDesc();
    }

    public Painting randomPainting() {
        return paintingRepository.randomPainting();
    }
}
