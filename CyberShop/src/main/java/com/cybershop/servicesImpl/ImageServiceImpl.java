package com.cybershop.servicesImpl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.cybershop.daos.ImageDAO;
import com.cybershop.models.Image;
import com.cybershop.services.ImageService;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageServiceImpl implements ImageService {

    @Autowired
    private ImageDAO dao;

    @Transactional
    @Override
    public void save(Image obj) {
        dao.create(obj);
    }

    @Transactional
    @Override
    public void remove(int id) {
        dao.delete(id);
    }

    @Transactional(readOnly = true)
    @Override
    public Image findById(int id) {
        return dao.getById(id);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Image> getByAll() {
        return dao.getAll();
    }

    @Transactional
    @Override
    public void updateMainImage(Image image) {
        dao.updateMainImage(image);
    }

    @Transactional
    @Override
    public void updateSubImage(List<Image> list) {
        dao.updateSubImage(list);
    }
    
    @Override
     public String uploadFile(MultipartFile aFile) {
        try {
            String mCloudName = "anhnt";
             String mApiKey = "585419367667758";
              String mApiSecret = "8cDwwpne9ZXblsrxwjfqClzYjJs";
            Cloudinary c = new Cloudinary("cloudinary://" + mApiKey + ":" + mApiSecret + "@" + mCloudName);
            File f = Files.createTempFile("temp", aFile.getOriginalFilename()).toFile();
            aFile.transferTo(f);
            Map response = c.uploader().upload(f, ObjectUtils.emptyMap());
            JSONObject json = new JSONObject(response);
            String url = json.getString("url");
            System.out.println(url);
            return url;
        } catch (Exception e) {
            return null;
        }
    }

}
