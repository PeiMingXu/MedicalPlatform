package com.xmut.service;


import com.xmut.pojo.Chat;
import com.xmut.utils.Pagination;

import java.util.List;

public interface ChatService {
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
