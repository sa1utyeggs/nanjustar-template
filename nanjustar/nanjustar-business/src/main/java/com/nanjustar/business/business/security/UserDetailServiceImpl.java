package com.nanjustar.business.business.security;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.nanjustar.api.moudle.security.api.ConsumerService;
import com.nanjustar.api.moudle.security.dto.ConsumerDetailDto;
import com.nanjustar.api.moudle.security.entity.Consumer;
import com.nanjustar.api.moudle.security.entity.ConsumerRole;
import com.nanjustar.api.moudle.security.entity.Role;
import com.nanjustar.common.constant.CommonConst;
import com.nanjustar.common.enums.GenderEnum;
import com.nanjustar.common.enums.LoginTypeEnum;
import com.nanjustar.common.exception.NanjustarException;
import com.nanjustar.common.utils.AssertUtil;
import com.nanjustar.common.utils.BeanCopyUtil;
import com.nanjustar.common.utils.IpUtils;
import com.nanjustar.mapper.mapper.security.ConsumerMapper;
import com.nanjustar.mapper.mapper.security.ConsumerRoleMapper;
import com.nanjustar.mapper.mapper.security.RoleMapper;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 自定义登陆实现类
 */
@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private ConsumerMapper consumerMapper;
    @Autowired
    private ConsumerRoleMapper consumerRoleMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Resource
    private HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        /*------------------------  用户检测开始  -----------------------------*/
        if (AssertUtil.isEmpty(username)) {
            throw new NanjustarException("用户名不能为空！");
        }
        Consumer consumer = consumerMapper.selectOne(new LambdaQueryWrapper<Consumer>()
                .eq(Consumer::getUsername, username)
                .eq(Consumer::getIsDisable, CommonConst.NOT_DISABLE)
                .eq(Consumer::getDelFlag, CommonConst.NOT_DELETE));
        if (AssertUtil.isNull(consumer)) {
            throw new NanjustarException("用户名或密码错误！");
        }
        /*------------------------  用户检测结束  -----------------------------*/
        return convertToUserDetails(consumer, request);
    }

    /**
     * 封装用户登陆信息
     *
     * @param consumer 用户信息
     * @param request  请求
     * @return 用户登陆信息
     */
    private UserDetails convertToUserDetails(Consumer consumer, HttpServletRequest request) {
        /*------------------------  查询用户权限信息开始  -----------------------------*/
        List<Integer> roleIds = consumerRoleMapper.selectList(new LambdaQueryWrapper<ConsumerRole>()
                        .eq(ConsumerRole::getConsumerId, consumer.getUserId()))
                .stream()
                .map(ConsumerRole::getRoleId)
                .collect(Collectors.toList());
        List<String> perms = roleMapper.selectList(new LambdaQueryWrapper<Role>()
                        .in(Role::getRoleId, roleIds))
                .stream()
                .map(Role::getRoleKey)
                .collect(Collectors.toList());
        /*------------------------  查询用户权限信息完成  -----------------------------*/
        /*------------------------  查询用户ip信息开始  -----------------------------*/
        String ipAddress = IpUtils.getIpAddress(request);
        String ipSource = IpUtils.getIpSource(ipAddress);
        UserAgent userAgent = IpUtils.getUserAgent(request);
        /*------------------------  查询用户ip信息完成  -----------------------------*/
        /*------------------------  数据转换开始  -----------------------------*/
        ConsumerDetailDto consumerDetailDto = BeanCopyUtil.copyObject(consumer, ConsumerDetailDto.class);
        consumerDetailDto.setGender(GenderEnum.getGenderNameByCode(consumer.getGender()));
        consumerDetailDto.setLoginType(LoginTypeEnum.getLoginTypeNameByCode(consumer.getLoginType()));
        consumerDetailDto.setRoleList(perms);
        consumerDetailDto.setLoginIp(ipAddress);
        consumerDetailDto.setLoginAddress(ipSource);
        consumerDetailDto.setOs(userAgent.getBrowser().getName());
        consumerDetailDto.setBrowser(userAgent.getOperatingSystem().getName());
        /*------------------------  数据转换完成  -----------------------------*/
        return consumerDetailDto;
    }
}
