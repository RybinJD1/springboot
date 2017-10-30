package com.security;

import com.entity.Buyer;
import com.services.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component("authService")
public class AuthenticationService implements UserDetailsService {

    @Autowired
    private BuyerService buyerService;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Buyer buyer = buyerService.findByBuyerEmail(email);
        if (buyer == null) {
            throw new UsernameNotFoundException("User not found");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + buyer.getRole().toString().toUpperCase()));
        return new org.springframework.security.core.userdetails.User(buyer.getEmail(), buyer.getPassword(),
                true, true, true, true, authorities);
    }
}
