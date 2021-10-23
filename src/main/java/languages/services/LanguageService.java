package languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import languages.models.Language;
import languages.repositories.LanguageRepository;


@Service
public class LanguageService {
    private final LanguageRepository repo;
    
    public LanguageService(LanguageRepository repo) {
        this.repo = repo;
    }
 
    public List<Language> allLanguages() {
        return repo.findAll();
    }
    
    public Language createLanguage(Language l) {
        return repo.save(l);
    }
    
    public Language findLanguage(Long id) {
        Optional<Language> opLang = repo.findById(id);
        if(opLang.isPresent()) {
            return opLang.get();
        } else {
            return null;
        }
    }
    
    public Language updateLanguage(Long id, String name, String creator, String currentVersion) {    	
    	Language l = new Language (id, name, creator, currentVersion);
        return repo.save(l);
    }
    
 
    public Language updateLanguage(Language l) {
        return repo.save(l);
    }
    
 
    public void deleteLanguage(Long id) {
        Optional<Language> optionalLanguage = repo.findById(id);
        if(optionalLanguage.isPresent()) {
            repo.deleteById(id);
        } 
    }
    
    
    
}
