package egovframework.com.cmm.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class EtcFileVO {
    /**
     *
     * 221223 별도의 첨부파일 업로드 VO
     *
     *
     */
    public String file_name = "";
    public String file_ori = "";
    public String file_length = "";
    public String file_idx = "";
    public String file_type = "";
    public String thumbnail = "";
    public String idx = "";
    public String file_desc = "";
    public String bbs_id = "";
    public String uni_id = "";
    public String bbs_idx = "";

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_ori() {
        return file_ori;
    }

    public void setFile_ori(String file_ori) {
        this.file_ori = file_ori;
    }

    public String getFile_length() {
        return file_length;
    }

    public void setFile_length(String file_length) {
        this.file_length = file_length;
    }

    public String getFile_idx() {
        return file_idx;
    }

    public void setFile_idx(String file_idx) {
        this.file_idx = file_idx;
    }

    public String getFile_type() {
        return file_type;
    }

    public void setFile_type(String file_type) {
        this.file_type = file_type;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getFile_desc() {

        return file_desc;
    }

    public void setFile_desc(String file_desc) {
        this.file_desc = file_desc;
    }

    public String getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(String bbs_id) {
        this.bbs_id = bbs_id;
    }

    public String getUni_id() {
        return uni_id;
    }

    public void setUni_id(String uni_id) {
        this.uni_id = uni_id;
    }

    public String getBbs_idx() {
        return bbs_idx;
    }

    public void setBbs_idx(String bbs_idx) {
        this.bbs_idx = bbs_idx;
    }

    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
