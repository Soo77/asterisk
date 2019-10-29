<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<ul class="sidebar navbar-nav">
      <li class="nav-item active" style="display: none">
        <div class="nav-link">
          <a href="#" data-toggle="modal" data-target="#menu-profilePhotoModal">
            <div class="thumbnail-wrapper">
              <div class="menu-profile-thumbnail img-thumbnail">
                <div class="centered">
                  <img src="/profile_photo.jpg" id="menu-profilePhoto">
                </div>
              </div>
            </div>
          </a>
          <div class="form-group">
            <button type="button" id="menu-modify-profile-btn"
              class="btn form-control btn-outline-success menu-modify-profile-btn">사진변경</button>
          </div>
          </di>
      </li>

      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#mypageModal">
          <i class="fas fa-fw fa-user"></i>
          <span>내 정보</span>
        </a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-chalkboard-teacher"></i>
          <span>나의 과외</span>
        </a>
      </li>


      <li class="nav-item">
        <a class="nav-link" href="#">
          <i class="fas fa-fw fa-users"></i>
          <span>선생님 찾기</span>
        </a>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-clipboard"></i>
          <span>게시판</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Notice Board:</h6>
          <a class="dropdown-item" href="#">공지사항</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Boards:</h6>
          <a class="dropdown-item" href="list?boardTypeNo=1">공부상담</a>
          <a class="dropdown-item" href="list?boardTypeNo=2">입시상담</a>
          <a class="dropdown-item" href="list?boardTypeNo=3">문제풀이</a>
        </div>
      </li>
      <div class="menu-profile-photo-upload">
        <input id="menu-profileFileInput" type="file">
      </div>
    </ul>