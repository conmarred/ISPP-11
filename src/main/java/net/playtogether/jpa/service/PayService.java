package net.playtogether.jpa.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import net.playtogether.jpa.entity.Pay;
import net.playtogether.jpa.repository.PayRepository;

@Service
public class PayService {

    private PayRepository payRepository;

    public PayService(PayRepository payRepository) {
        this.payRepository = payRepository;
    }

    @Transactional
    public void save(Pay pay) {
        this.payRepository.save(pay);
    }

    @Transactional
    public void delete(Pay pay) {
        this.payRepository.delete(pay);
    }

    @Transactional
    public Pay findLastPayByUsername(String username) {
        return this.payRepository.findLastPayByUsername(username);
    }

    @Transactional
    public Pay findLastFinishedPayForChampionshipByUsername(String username, Integer championshipId) {
        return this.payRepository.findLastFinishedPayForChampionshipByUsername(username, championshipId);
    }

    @Transactional
    public List<Pay> findIdPaysNotFinishedByUsername(String username){
        return this.payRepository.findPaysNotFinishedByUsername(username);
    }

    public void deleteAll(List<Pay> pays) {
        this.payRepository.deleteAll(pays);
    }
    
}
