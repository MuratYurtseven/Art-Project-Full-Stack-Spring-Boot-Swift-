package com.Murat.ArtProject.Models;



import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;
@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Painting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int paintId;
    private String name;
    private String imageUrl;
    private String description;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id")

    private Location location;
    private int artistId;
    private String analysis;
    @Temporal(TemporalType.DATE)
    private Date completionDate;
    private Float popularity;
    private Float recommendedRate;
    private Float likedRate;
    private Float visitedRate;

    public Float getPopularity() {
        return popularity;
    }

    public void setPopularity(Float popularity) {
        this.popularity = popularity;
    }

    public Float getRecommendedRate() {
        return recommendedRate;
    }

    public void setRecommendedRate(Float recommendedRate) {
        this.recommendedRate = recommendedRate;
    }

    public Float getLikedRate() {
        return likedRate;
    }

    public void setLikedRate(Float likedRate) {
        this.likedRate = likedRate;
    }

    public Float getVisitedRate() {
        return visitedRate;
    }

    public void setVisitedRate(Float visitedRate) {
        this.visitedRate = visitedRate;
    }

    public int getPaintId() {
        return paintId;
    }

    public void setPaintId(int paintId) {
        this.paintId = paintId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public Date getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(Date completionDate) {
        this.completionDate = completionDate;
    }
}