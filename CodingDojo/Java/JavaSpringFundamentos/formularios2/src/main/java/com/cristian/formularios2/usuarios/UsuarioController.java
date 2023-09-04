package com.cristian.formularios2.usuarios;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
    @GetMapping("")
    public String usuarios(Model model, @RequestParam("codigo") String codigo){
        Usuario usuario = new Usuario();

        //Consulta a la base de datos
        model.addAttribute("usuario", usuario);
        return "usuario";
    }
}
