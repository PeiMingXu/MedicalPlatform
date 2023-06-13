package com.xmut.service.impl;


import com.xmut.mapper.ChatMapper;
import com.xmut.pojo.Chat;
import com.xmut.service.ChatService;

import com.xmut.utils.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {
    @Autowired
    ChatMapper chatMapper;

    @Override
    public int insertChat(Chat chat) {
        return chatMapper.insertChat(chat);
    }

    @Override
    public int updateChat(Chat chat) {
        return chatMapper.updateChat(chat);
    }

    @Override
    public List<Chat> findByDc(Integer dc_id) {
        return chatMapper.findByDc(dc_id);
    }

    @Override
    public Chat selectChatByDcOrUser(Integer id) {
        return chatMapper.selectChatByDcOrUser(id);
    }

    @Override
    public Chat selectChatByNum(Chat chat) {
        return chatMapper.selectChatByNum(chat);
    }

    @Override
    public List<Chat> pageChat(Pagination page) {
        return chatMapper.pageChat(page);
    }

    @Override
    public int total() {
        return chatMapper.total();
    }

    @Override
    public List<Chat> getChatListByName(String u_name) {
        return chatMapper.getChatListByName(u_name);
    }

    @Override
    public Chat selectChatById(String id) {
        return chatMapper.selectChatById(id);
    }

    @Override
    public int zaixian(Chat chat) {
        return chatMapper.zaixian(chat);
    }

    @Override
    public int xiaxianChat(Chat chat) {
        return chatMapper.xiaxianChat(chat);
    }
}
