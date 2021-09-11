package joey.blog.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ImageControl {

    @Value("${Joey.uploadPath}")
    private String uploadPath;

    @GetMapping("/admin/upload")
    public String upload(){
        return "admin/upload";
    }

    @PostMapping("/admin/upload")
    public String singleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes) {
        if (file.isEmpty()) {
            return "admin/upload";
        }
        try {
            // Get the file and save it somewhere
            byte[] bytes = file.getBytes();
            Path path = Paths.get(uploadPath + file.getOriginalFilename());
            Files.write(path, bytes);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "admin/upload";
    }

    @GetMapping("/admin/images")
    public String displayImage(ModelMap m){

        File imagePath = new File(uploadPath);
        File[] files= imagePath.listFiles();
        String[] images = new String[files.length];
        for(int i=0; i < files.length; i++ ){
            images[i] = files[i].getName();
        }
        m.addAttribute("images",images);
        return "admin/image";
    }



}