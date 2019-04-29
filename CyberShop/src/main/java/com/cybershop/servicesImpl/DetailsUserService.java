package com.cybershop.servicesImpl;

import com.cybershop.daosImpl.AdminDAOImpl;
import java.util.ArrayList;
import java.util.List;
import com.cybershop.models.Admin;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("detailsUserService")
public class DetailsUserService implements UserDetailsService{
    
    @Autowired 
    AdminDAOImpl userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) 
            throws UsernameNotFoundException {
        Admin user = userRepository.getByUsername(username);
        if(user.getStatus()){
            List<GrantedAuthority> roles = buildRoles(user.getRole());
            //TODO compare password later
            return userWithRoles(user, roles);
        }else{
            return userWithRoles(null, null);
        }
        
    }

    private List<GrantedAuthority> buildRoles(String userRole) {
        List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority("ROLE_" + userRole));
        return roles;
    }

    private UserDetails userWithRoles(Admin user, List<GrantedAuthority> roles) {
        return new org.springframework.security.core.userdetails.User(
                user.getUsername(), user.getPassword(), true, true, true, true, roles);
    }
    
}
