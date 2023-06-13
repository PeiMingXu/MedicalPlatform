package com.xmut.mapper;

import com.xmut.pojo.Chat;


import com.xmut.utils.Pagination;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ChatMapper {
    int insertChat(Chat chat);
    int updateChat(Chat chat);
    List<Chat> findByDc(Integer dc_id);
    Chat selectChatByDcOrUser(Integer id);
    Chat selectChatByNum(Chat chat);
    List<Chat> pageChat(Pagination page);
    int total();
    List<Chat> getChatListByName(String u_name);
    Chat selectChatById(String id);
    int zaixian(Chat chat);
    int xiaxianChat(Chat chat);

}
