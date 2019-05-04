package com.cybershop.other;

import java.io.Serializable;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class MyFile implements Serializable {

    private static final long serialVersionUID = 1L;
    private List<MultipartFile> multipartFile;
    private String description;

    public MyFile() {
    }

    public List<MultipartFile> getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(List<MultipartFile> multipartFile) {
        this.multipartFile = multipartFile;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    
}
