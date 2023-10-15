package kr.ed.haebeop.config;

import kr.ed.haebeop.util.LectureInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

// dispatcher-servlet.xml를 대신하는 ServletContext.java : kr.ed.haebeop.config
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ServletContext implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        // 접두사와 접미사 설정
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 접근 자원에 대한 권한 설정
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/WEB-INF/views/admin");
        registry.addResourceHandler("/apply/**").addResourceLocations("/WEB-INF/views/apply");
        registry.addResourceHandler("/attendance/**").addResourceLocations("/WEB-INF/views/attendance");
        registry.addResourceHandler("/board/**").addResourceLocations("/WEB-INF/views/board");
        registry.addResourceHandler("/dataRoom/**").addResourceLocations("/WEB-INF/views/dataRoom");
        registry.addResourceHandler("/event/**").addResourceLocations("/WEB-INF/views/event");
        registry.addResourceHandler("/faq/**").addResourceLocations("/WEB-INF/views/faq");
        registry.addResourceHandler("/layout/**").addResourceLocations("/WEB-INF/views/layout");
        registry.addResourceHandler("/lecture/**").addResourceLocations("/WEB-INF/views/lecture");
        registry.addResourceHandler("/news/**").addResourceLocations("/WEB-INF/views/news");
        registry.addResourceHandler("/notice/**").addResourceLocations("/WEB-INF/views/notice");
        registry.addResourceHandler("/qna/**").addResourceLocations("/WEB-INF/views/qna");
        registry.addResourceHandler("/test/**").addResourceLocations("/WEB-INF/views/test");
        registry.addResourceHandler("/user/**").addResourceLocations("/WEB-INF/views/user");
        registry.addResourceHandler("/util/**").addResourceLocations("/WEB-INF/views/util");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        WebMvcConfigurer.super.addInterceptors(registry);
        registry.addInterceptor(lectureInterceptor()).addPathPatterns("/lecture/player");
    }

    @Bean
    public LectureInterceptor lectureInterceptor() {
        // Interceptor 안에서 Service를 사용하기 위해 스프링에서 관리할 수 있도록 Bean으로 설정
        return new LectureInterceptor();
    }
}
