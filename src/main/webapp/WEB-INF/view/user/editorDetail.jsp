<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css"/>


<style>
    .star {
        position: relative;
        color: #ddd;
        font-size: 35px;
        word-break: normal;
        word-wrap: normal;
    }

    .star input {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        opacity: 0;
        cursor: pointer;
        display: initial;
        top: 5px;
    }

    .star span {
        width: 0;
        position: absolute;
        left: 0;
        color: #b67f5f;
        overflow: hidden;
        pointer-events: none;
        text-shadow: -1px 0 #b67f5f, 0 1px #b67f5f, 1px 0 #b67f5f, 0 -1px #b67f5f;
    }

    .customLook-detail {
        --tag-bg: grey;
        --tag-hover: #ce0078;
        --tag-text-color: #fff;
        --tags-border-color: silver;
        --tag-text-color--edit: #111;
        --tag-remove-bg: var(--tag-hover);
        --tag-pad: 0.6em 1em;
        --tag-inset-shadow-size: 2.0em;
        --tag-remove-btn-bg--hover: black;
        display: inline-block;
        min-width: 0;
        border: none;

    }

    .customLook-detail .tagify__tag {
        margin-top: 0;
    }

    .customLook-detail .tagify__tag > div {
        border-radius: 25px;
        cursor: pointer;
    }

    .customLook-detail .tagify__tag__removeBtn {
        opacity: 0;
        transform: translateX(-6px) scale(0.5);
        margin-left: -3ch;
        transition: 0.12s;
    }

    .customLook-detail + button {
        color: #0052bf;
        font: bold 1.4em/1.65 Arial;
        border: 0;
        background: none;
        box-shadow: 0 0 0 2px inset currentColor;
        border-radius: 50%;
        width: 1.65em;
        height: 1.65em;
        cursor: pointer;
        outline: none;
        transition: 0.1s ease-out;
        margin: 0 0 0 5px;
        vertical-align: top;
    }

    .customLook-detail + button:hover {
        box-shadow: 0 0 0 5px inset currentColor;
    }

    .tagify__tag > div > * {
        white-space: nowrap;
    }

    .tagify__input {
        display: none;
    }
</style>
<section class="block">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 mb-5">
                <div class="heading3">
                    <h3>작가 소개</h3>
                </div>
                <h3>${editorDetail.nickname} 작가 포트폴리오</h3>

            </div>
        </div>
        <div class="row mb-5">
            <div class="col-sm-9">
                <c:if test="${editorDetail.vrm != null}">
                    <div class="mb-3">
                        <canvas id="canvas"></canvas>
                    </div>
                    <div class="mb-3 t-center" id="vrm-width">
                        <a
                                href="/editor/vrm?editor-id=${editorDetail.editorId}" target="_blank">작가의 VRM
                            크게 보러 가기</a>
                    </div>
                </c:if>
                <c:if test="${editorDetail.content == null}">
                    <div class="block t-center">아직 자기소개를 작성하지 않았습니다</div>
                </c:if>
            </div>
            <div class="col-sm-3">
                <div class="t-center" style="border: 1px solid #343434;">
                    <div class="p-2 d-flex j-around" style="gap: 10rem;">

                        <c:if test="${USER.userId != editorDetail.userId}">
                            <div style="font-size: 25px; cursor: pointer" id="report">
                                <i class="fa fa-exclamation" style="color: #ff4d4d;"></i>
                            </div>
                            <div style="font-size: 25px; cursor: pointer" id="like">
                                <i id="heart" class="fa fa-heart" style="color: grey;"></i>
                                <input type="hidden" id="likeFlag" value=""/>
                            </div>
                        </c:if>


                    </div>


                    <div class="circle-profile-area">
                        <img class="circle-profile" alt=""
                             src="${editorDetail.profileImage}">
                    </div>
                    <h4>${editorDetail.nickname}</h4>
                    <h5>${editorDetail.introduce}</h5>
                    <input type="text" name="basic" class="customLook-detail" value="${tag}">
                    <div>
                        <c:if test="${not empty EDITOR_ID && EDITOR_ID eq editorDetail.editorId}">
                            <div id="edit"
                                 style="background-color: #fff; height: 50px; color: black; line-height: 50px; border-top: 1px solid black; font-weight: bold; cursor: pointer;"
                                 onclick="location.href='/editor/editor-edit?editor-id=${editorDetail.editorId}'">
                                소개 수정하기
                            </div>
                        </c:if>

                        <div style="background-color: #343434; height: 50px; color: white; line-height: 50px; font-weight: bold;">
                            가격 옵션
                        </div>
                        <c:if test="${empty editorPrice}">
                            <div><h5>가격등록이 되지않았습니다.</h5></div>
                        </c:if>
                        <c:if test="${not empty editorPrice}">
                            <c:forEach items="${editorPrice}" var="editorPrice">
                                <div class="d-flex j-around">
                                    <div><h5>${editorPrice.options}</h5></div>
                                    <div><h5><fmt:formatNumber value="${editorPrice.price}" pattern="#,###" />
                                    원</h5></div>
                                </div>
                            </c:forEach>
                            <c:if test="${editorDetail.editorId != EDITOR_ID}">
                                <div id="suggest"
                                     style="background-color: #ff2929; height: 50px; color: white; line-height: 50px; font-weight: bold; cursor: pointer"
                                     onclick="location.href='/payment/payment-page?editor-id=${editorDetail.editorId}'">
                                    작가에게 의뢰하기
                                </div>
                            </c:if>
                        </c:if>
                    </div>

                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-sm-12 t-center mt-5">${editorDetail.content}</div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <c:choose>
                    <c:when test="${morph != null}">
                        <div style="border: 1px solid black"><h5>${morph}</h5></div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-sm-1">
                            <img width="100" height="100" src="/image/bot.png"
                                 style="margin-left: -20px; margin-top: -35px;">
                        </div>
                        <div class="col-sm-11" style="border: 1px solid black"><h5>아직 리뷰가 없어요..</h5></div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-sm-2">
                <div style="display: inline-block; vertical-align: middle;">
                <span class="star"> ★★★★★ <span id="place-score"
                                                style="width: 60%;">★★★★★</span> <input type="range"
                                                                                        name="place-score"
                                                                                        id="star-val"
                                                                                        oninput="drawStar(this)"
                                                                                        value="6"
                                                                                        step="2" min="0" max="10">

                </span>
                </div>
                <script>
                    function drawStar(target) {
                        document.querySelector('#place-score').style.width = (target.value * 10) + '%';
                    }
                </script>
            </div>
            <div class="col-sm-2" style="height: 48px; line-height: 58px">
                <strong>별점을 선택해주세요</strong>
            </div>
            <div class="col-sm-11">
            <textarea rows="3" cols="" style="width: 100%; resize: none;"
                      placeholder="리뷰를 입력해주세요." id="review-content"></textarea>
            </div>
            <div class="col-sm-1">
                <div
                        style="background-color: #343434; text-align: center; height: 65px; color: white; line-height: 65px; cursor: pointer"
                        id="review-submit">작성
                </div>
            </div>
        </div>
        <div class="row mb-5">
            <div class="col-sm-12">
                <div>
                    <table class="w-full">
                        <colgroup>

                            <col width="15%">
                            <col width="50%">
                            <col width="15%">
                            <col width="10%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th class="list-th">별점</th>
                            <th class="list-th tleft">내용</th>
                            <th class="list-th"></th>
                            <th class="list-th">작성자</th>
                            <th class="list-th">작성일</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${reviewList}" var="review">
                            <tr class="list-tr">

                                <td style="color: gold">${review.star}</td>
                                <td class="t-left"><textarea rows="3" cols=""
                                                             style="width: 100%; resize: none; border: none; outline: none; cursor: default"
                                                             readonly
                                                             placeholder="리뷰를 입력해주세요.">${review.content}</textarea>
                                </td>
                                <td>
                                    <div
                                            style="display: flex; flex-direction: column; gap: 1rem; padding: 0 30%; margin-bottom: 4px; margin-top: 4px">
                                        <c:if test="${review.userId == USER.userId}">
                                            <button type="button" class="btn btn-danger"
                                                    onclick="deleteReview(${review.reviewId})" id="review-del">삭제
                                            </button>
                                        </c:if>
                                    </div>
                                </td>
                                <td>${review.nickname}</td>
                                <td>${review.createdAt}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script async src="https://unpkg.com/es-module-shims@1.3.6/dist/es-module-shims.js"></script>

<script type="importmap">
    {
        "imports": {
            "three": "https://unpkg.com/three@0.154.0/build/three.module.js",
            "three/addons/": "https://unpkg.com/three@0.154.0/examples/jsm/",
            "@pixiv/three-vrm": "/js/three-vrm.module.js"
        }
    }
</script>

<script type="module">
    import * as THREE from 'three';
    import {GLTFLoader} from 'three/addons/loaders/GLTFLoader.js';
    import {OrbitControls} from 'three/addons/controls/OrbitControls.js';
    import {VRMLoaderPlugin, VRMUtils} from '@pixiv/three-vrm';

    // renderer
    let renderer = new THREE.WebGLRenderer({
        antialias: true,
        canvas: document.querySelector("#canvas")
    });
    renderer.setSize($('#vrm-width').width(), $('#vrm-width').height() * 30);

    // document.body.appendChild(renderer.domElement);

    // camera
    const camera = new THREE.PerspectiveCamera(30.0, window.innerWidth / window.innerHeight, 0.1, 20.0);
    camera.position.set(0.0, 1.0, 5.0);

    // camera controls
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.screenSpacePanning = true;
    controls.target.set(0.0, 1.0, 0.0);
    controls.update();

    // scene
    const scene = new THREE.Scene();

    scene.background = new THREE.Color("black")

    // light
    const light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0.0, 0.5, 0.0).normalize();
    scene.add(light);
    // lookat target

    const lookAtTarget = new THREE.Object3D();
    camera.add(lookAtTarget);


    // gltf and vrm
    let currentVrm = undefined;
    let currentMixer = undefined;

    const loader = new GLTFLoader();
    loader.crossOrigin = 'anonymous';

    loader.register((parser) => {

        return new VRMLoaderPlugin(parser);

    });

    loader.load(
        // URL of the VRM you want to load
        '${editorDetail.vrm}',

        // called when the resource is loaded
        (gltf) => {

            const vrm = gltf.userData.vrm;

            // calling these functions greatly improves the performance
            VRMUtils.removeUnnecessaryVertices(gltf.scene);
            VRMUtils.removeUnnecessaryJoints(gltf.scene);

            // Disable frustum culling
            vrm.scene.traverse((obj) => {

                obj.frustumCulled = false;

            });

            currentVrm = vrm;
            console.log(vrm);
            scene.add(vrm.scene);
            // prepareAnimation(vrm);
            vrm.lookAt.target = lookAtTarget;


            function animate() {
                requestAnimationFrame(animate)
                gltf.scene.rotation.y += 0.001
                renderer.render(scene, camera)

            }

        },

        // called while loading is progressing
        (progress) => console.log('Loading model...', 100.0 * (progress.loaded / progress.total), '%'),

        // called when loading has errors
        (error) => console.error(error),
    );

    // function prepareAnimation(vrm) {
    //
    //
    //     currentMixer = new THREE.AnimationMixer(vrm.scene);
    //
    //     const quatA = new THREE.Quaternion(0.0, 0.0, 0.0, 1.0);
    //     const quatB = new THREE.Quaternion();
    //
    //     quatB.setFromEuler(new THREE.Euler(0.0, 0.0, Math.PI / 4));
    //
    //     const armTrack = new THREE.QuaternionKeyframeTrack(
    //         vrm.humanoid.getNormalizedBoneNode('leftUpperArm').name + '.quaternion', // name
    //         [0.0, 0.5, 1.0], // times
    //         [...quatA.toArray(), ...quatA.toArray(), ...quatA.toArray()] // values (모두 동일)
    //     );
    //
    //     const blinkTrack = new THREE.NumberKeyframeTrack(
    //         vrm.expressionManager.getExpressionTrackName('blink'), // name
    //         [0.0, 1.0, 2.0], // times
    //         [0.0, 1.0, 0.0] // values
    //     );
    //
    //     const clip = new THREE.AnimationClip('Animation', 1.0, [armTrack, blinkTrack]);
    //     const action = currentMixer.clipAction(clip);
    //     action.play();
    //
    // }

    // helpers
    const gridHelper = new THREE.GridHelper(10, 10);
    scene.add(gridHelper);

    const axesHelper = new THREE.AxesHelper(5);
    scene.add(axesHelper);

    // animate
    const clock = new THREE.Clock();
    clock.start();

    function animate() {

        requestAnimationFrame(animate);

        const deltaTime = clock.getDelta();

        if (currentVrm) {

            currentVrm.update(deltaTime);

        }

        if (currentMixer) {

            currentMixer.update(deltaTime);

        }

        renderer.render(scene, camera);


    }

    animate();

    window.addEventListener('mousemove', (event) => {

        lookAtTarget.position.x = 10.0 * ((event.clientX - 0.5 * window.innerWidth) / window.innerHeight);
        lookAtTarget.position.y = -10.0 * ((event.clientY - 0.5 * window.innerHeight) / window.innerHeight);

    });


    const target = document.querySelector('#vrm-width');
    // 크기변화를 관찰할 요소지정
    const resizeObserver = new ResizeObserver((entries) => {
        renderer = new THREE.WebGLRenderer({
            antialias: true,
            canvas: document.querySelector("#canvas")
        });
        renderer.setSize($('#vrm-width').width(), $('#vrm-width').height() * 30);
    })

    resizeObserver.observe(target);
</script>
<script>
    $(document).ready(function () {
        var input = document.querySelector('input[name=basic]');


        var tagify = new Tagify(input, {
            userInput: false,
            hooks: {
                beforeRemoveTag: function () {
                    return new Promise((resolve, reject) => {
                        reject();
                    })
                }
            }
        });

        $('.tagify__tag-text').parent().on('click', function () {
            let keyword = $(this).text();
            let type = 'tag'
            location.href = "/editor/list?keyword=" + keyword + "&type=" + type;
        })

        isFollow();

        $("#report").click(function () {
            fetch('/report/report-board', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    reportUserId: `${editorDetail.userId}`,
                    userId: 1,
                    boardId: null,
                    editorId: `${editorDetail.editorId}`
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data) {
                        alert(data.message)
                    } else {
                        alert("신고 되었습니다.")
                    }
                })
                .catch(error => console.error('Error:', error));
        })

        $("#review-submit").click(function () {
            let currentURL = window.location.href

            let strings = currentURL.split("/");
            let editorId = strings[5];


            console.log(currentURL);
            let content = $("#review-content").val();

            let star = $("#star-val").val();


            if (content.length <= 0) {
                alert("리뷰를 입력해주세요.");
                return;
            }

            fetch('/review/save', {

                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    editorId: editorId,
                    userId: `${USER.userId}`,
                    content: content,
                    count: star,
                    nickname: `${USER.nickname}`


                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data) {

                        alert(data.message)
                    } else {
                        location.reload();
                    }
                })


        })

        $('#like').on('click', function () {
            follow();
        });

    })

    function deleteReview(reviewId) {


        fetch('/review/del/' + reviewId, {
            method: 'DELETE',

        })

            .then(response => {
                if (!response.ok) {
                    alert("")
                } else {
                    location.reload();
                }
            })
            .then(data => console.log(data))
            .catch(error => console.error('Error:', error));


    }

    function follow() {
        fetch('/follow/new-follow', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userId: `${USER.userId}`,
                editorId: `${editorDetail.editorId}`
            })
        })
            .then(response => response.json()
            )
            .then(data => {
                if (data.code === 200) {
                    $('#likeFlag').val(1);
                    $('#heart').css('color', '#ff2929');
                } else {
                    $('#likeFlag').val(0);
                    $('#heart').css('color', 'grey');
                }
                // location.reload();
            })
            .catch(error => {
                console.log(error);
            });
    }

    function isFollow() {
        fetch('/follow/is-follow', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                userId: `${USER.userId}`,
                editorId: `${editorDetail.editorId}`
            })
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                if (data === 1) {
                    $('#likeFlag').val(data);
                    $('#heart').css('color', '#ff2929');
                }
            })
            .catch(error => console.log(error));
    }

</script>
<%@ include file="/WEB-INF/view/layout/footer.jsp" %>