package com.Murat.ArtProject.Repository;

import com.Murat.ArtProject.Models.Painting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaintingRepository extends JpaRepository<Painting,Integer> {

    List<Painting> findTop15ByOrderByPopularityDesc();

    @Query("SELECT p FROM Painting p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Painting> searchPaintings(String keyword);

    List<Painting> findTop15ByOrderByRecommendedRateDesc();

    List<Painting> findTop15ByOrderByLikedRateDesc();

    List<Painting> findTop15ByOrderByVisitedRateDesc();

    @Query(value = "SELECT * FROM Painting ORDER BY RANDOM() LIMIT 1", nativeQuery = true)
    Painting randomPainting();
}
