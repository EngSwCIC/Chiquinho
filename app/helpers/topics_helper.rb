module TopicsHelper
	##
    # Constrói a query SQL para busca de posts na database com os filtros existentes na sessão
    def build_query_from_filters
        query = []
        ['course', 'professor', 'subject'].each do |filter|
            tag_sym = filter.to_sym
            filter_sym = "filter_#{filter}_id".to_sym
            if !session[filter_sym].blank?
                query << "#{filter}_id = #{session[filter_sym]}"
            end
        end
        query = query.join(' and ')
        query << ((query.length > 0) ? (' and ') : (''))
        query << 'topic_id is null and deleted = false'

        return query
    end

    ##
    # Função auxiliar que procura na database o nome dos objetos filtrados (professor, curso, matéria) e os concatena em uma string
    def get_filters_string
        str = []
        if !session[:filter_course_id].blank?
        	course = Course.find(session[:filter_course_id]).name
            str.push normalize_str(course)
        end
        if !session[:filter_subject_id].blank?
        	subject = Subject.find(session[:filter_subject_id]).name
            str.push normalize_str(subject)
        end
        if !session[:filter_professor_id].blank?
        	professor = Professor.find(session[:filter_professor_id]).name
            str.push normalize_str(professor)
        end
        str = str.join(" · ")
        if !str.blank?
        	str = "Em: " + str
        end
        return str
    end

    def normalize_str(str)
    	str.downcase.capitalize
    end

end
