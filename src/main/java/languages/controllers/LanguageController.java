package languages.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import languages.models.Language;
import languages.services.LanguageService;



@Controller
public class LanguageController {
	private final LanguageService serv;
	 
	 public LanguageController(LanguageService serv) {
	     this.serv = serv;
	     }

	 
	 @RequestMapping("/languages")
	 public String index(@ModelAttribute("language") Language language,Model model) {
	     List<Language> languages = serv.allLanguages();
	     model.addAttribute("languages", languages);
	     return "/languages/index.jsp";

	 }
	 
	 @RequestMapping(value="/languages", method=RequestMethod.POST)
	 public String create(@Valid @ModelAttribute("language") Language language, BindingResult result) {
	     if (result.hasErrors()) {
	         return "/languages/index.jsp";
	     } else {
	         serv.createLanguage(language);
	         return "redirect:/languages";
	     }
	 }
	 
	 @RequestMapping(value="/languages/{id}")
	 public String display(@PathVariable("id") Long id, Model model) {
	     Language language = new Language();
	     language = serv.findLanguage(id);
		 model.addAttribute(language);
		 return "/languages/show.jsp";
	 }

	 @RequestMapping("/languages/{id}/edit")
	 public String edit(@PathVariable("id") Long id, Model model) {
	     Language language = serv.findLanguage(id);
	     model.addAttribute(language);
	     return "/languages/edit.jsp";
	 }
	 
	 @RequestMapping(value="/languages/{id}", method=RequestMethod.PUT)
	 public String update(@Valid @ModelAttribute("language") Language language, BindingResult result) {
	     if (result.hasErrors()) {
	         return "/languages/edit.jsp";
	     } else {
	         serv.updateLanguage(language);
	         return "redirect:/languages";
	     }
	 }
	 
	 @RequestMapping(value="/languages/{id}", method=RequestMethod.DELETE)
	 public String destroy(@PathVariable("id") Long id) {
	     serv.deleteLanguage(id);
	     return "redirect:/languages";
	 }
}
