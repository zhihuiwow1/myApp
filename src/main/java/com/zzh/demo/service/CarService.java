package com.zzh.demo.service;

import com.zzh.demo.domain.Car;
import com.zzh.demo.repository.CarRepository;
import com.zzh.demo.service.dto.CarDTO;
import com.zzh.demo.service.mapper.CarMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Service Implementation for managing Car.
 */
@Service
@Transactional
public class CarService {

    private final Logger log = LoggerFactory.getLogger(CarService.class);

    private final CarRepository carRepository;

    private final CarMapper carMapper;

    public CarService(CarRepository carRepository, CarMapper carMapper) {
        this.carRepository = carRepository;
        this.carMapper = carMapper;
    }

    /**
     * Save a car.
     *
     * @param carDTO the entity to save
     * @return the persisted entity
     */
    public CarDTO save(CarDTO carDTO) {
        log.debug("Request to save Car : {}", carDTO);
        Car car = carMapper.toEntity(carDTO);
        car = carRepository.save(car);
        return carMapper.toDto(car);
    }

    /**
     * Get all the cars.
     *
     * @return the list of entities
     */
    @Transactional(readOnly = true)
    public List<CarDTO> findAll() {
        log.debug("Request to get all Cars");
        return carRepository.findAll().stream()
            .map(carMapper::toDto)
            .collect(Collectors.toCollection(LinkedList::new));
    }

    /**
     * Get one car by id.
     *
     * @param id the id of the entity
     * @return the entity
     */
    @Transactional(readOnly = true)
    public CarDTO findOne(Long id) {
        log.debug("Request to get Car : {}", id);
        Car car = carRepository.findOne(id);
        return carMapper.toDto(car);
    }

    /**
     * Delete the car by id.
     *
     * @param id the id of the entity
     */
    public void delete(Long id) {
        log.debug("Request to delete Car : {}", id);
        carRepository.delete(id);
    }
}
