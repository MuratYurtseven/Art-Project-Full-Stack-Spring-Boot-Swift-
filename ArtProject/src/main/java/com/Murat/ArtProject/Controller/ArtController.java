package com.Murat.ArtProject.Controller;

import com.Murat.ArtProject.Models.Artist;
import com.Murat.ArtProject.Models.Painting;
import com.Murat.ArtProject.Services.ArtistService;
import com.Murat.ArtProject.Services.PaintingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@RequestMapping("/paintings")
@RestController
public class ArtController {

    @Autowired
    private PaintingService paintingService;

    @Autowired
    private ArtistService artistService;

    @GetMapping("/allPaintings")
    public Page<Painting> getAllPaintings(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "10") int size){

        return paintingService.getAllPaintings(PageRequest.of(page,size));
    }

    @GetMapping("search")
    public ResponseEntity <List<Painting>> searchPaintings(@RequestParam String keyword){
        return new ResponseEntity<>(paintingService.searchPaintings(keyword), HttpStatus.OK);
    }

    @GetMapping("/mostPopularPaintings")
    public ResponseEntity<List<Painting>> getPopularPaintings(){
        return new ResponseEntity<>(paintingService.getPopularPaintings(),HttpStatus.OK);
    }

    @GetMapping("/recommendedPaintings")
    public ResponseEntity<List<Painting>> getRecommendedPaintings(){
        return new ResponseEntity<>(paintingService.getRecommendedPaintings(),HttpStatus.OK);
    }

    @GetMapping("/mostLikedPaintings")
    public ResponseEntity<List<Painting>> getMostLikedPaintings(){
        return new ResponseEntity<>(paintingService.getMostLikedPaintings(),HttpStatus.OK);
    }

    @GetMapping("/mostVisitedPaintings")
    public ResponseEntity<List<Painting>> getMostVisitedPaintings(){
        return new ResponseEntity<>(paintingService.getMostVisitedPaintings(),HttpStatus.OK);
    }

    @GetMapping("/randomPainting")
    public ResponseEntity<Painting> getPaintingOfTheDay(){
        return new ResponseEntity<>(paintingService.randomPainting(),HttpStatus.OK);
    }


    @GetMapping("/artist/{id}")
    public ResponseEntity<Artist> getArtistById(@PathVariable int id){
        return new ResponseEntity<>(artistService.getArtistById(id),HttpStatus.OK);
    }


}
