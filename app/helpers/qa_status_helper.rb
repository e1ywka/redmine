module QaStatusHelper
  # Возвращает статус тикета по тестированию: исполнитель, версия, статус
  # @param [Issue] issue
  def issue_status(issue)
    return "#{issue.assigned_to}, #{issue.status}"
  end

  # Возвращает Issue, которое связано с параметром issue, имеет указанный трекер и указанное настраеваемое поле
  # Если условиям удовлетворяет несколько тикетов, берется тикет с наибольшей версией
  # @param [Issue] issue
  def relates_to_testers(issue, params)
    # Проверяем наличие параметров в хэше: tracker_name, custom_field_name
    return if ((params[:tracker_name] == nil) || (params[:custom_field_name] == nil))
    # Выбираем тикеты с указанным трекером и кастомным полем
    return if issue.relations_to.empty?
    related_issues = issue.relations_to.select { |iss_rel|
      iss_rel.other_issue(issue).tracker.name == params[:tracker_name]
    }

    # При наличии нескольких тикетов сравниваем версии и выбираем с большей
    return related_issues[0]
  end

  # Выбираем тикет с наибольшей версией
  def get_with_biggest_version(issues)
    # Алгоритм сравнения: разделяем версию по точкам, сравниваем цифры, начиная с первой
    # 
  end

  # Создает ссылку на форму создания тикета
  def link_to_new_test_issue(params)
  end
end
