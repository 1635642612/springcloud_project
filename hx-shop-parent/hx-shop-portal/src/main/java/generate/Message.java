package generate;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * message
 * @author 
 */
@Data
public class Message implements Serializable {
    private Integer id;

    private String content;

    /**
     * 创建人ID
     */
    private Integer creatorid;

    /**
     * 留言人姓名
     */
    private String createname;

    /**
     * 0：留言 1：回复
     */
    private Integer type;

    /**
     * 状态 0：删除
     */
    private Integer status;

    /**
     * 留言时间
     */
    private Date createtime;

    /**
     * 目标发送人ID
     */
    private Integer targetid;

    /**
     * 是否已读：0未读，1已读
     */
    private Integer isread;

    private static final long serialVersionUID = 1L;
}