package com.cristian.formularios2;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home(HttpSession session, Model model){
        // String usuario = "Cristian Arevalo";
        // session.setAttribute("User", usuario);
        model.addAttribute("usuario", "Este es el usuario !! ");
        return "index";
    }

    @GetMapping("/usuario")
    public String usuario(){
        return "usuario";
    }

    @PostMapping("/")
    public String registro(
        @RequestParam("nombre") String nombre, 
        @RequestParam("apellido") String apellido,
        @RequestParam("codigo") String codigo,

        @RequestParam(value= "radio", required = false) String radio, 
        @RequestParam(value= "intereses", required = false) String intereses,
        @RequestParam(value= "color", required = false) String color,
        @RequestParam(value= "fechaNacimiento", required = false) String fechaNacimiento,

        HttpSession session
        ){
            System.out.println(radio);
            System.out.println(intereses);
            System.out.println(color);
            System.out.println(fechaNacimiento);

            int codInt;
            try{
                codInt = Integer.parseInt((codigo));
            } catch (NumberFormatException e){
                return "index";
            }
        session.setAttribute("usuarioActual",
            nombre.substring(0, 2)
            .concat(String.valueOf(codInt))
            .concat(apellido.substring(2))
        );
        return "redirect:/dashboard"; //Nunca renderizar desde método post, siempre utilizar redirect
    }
//
    @GetMapping("/dashboard")
    public String dashboard(){
        return "dashboard";
    }
}
