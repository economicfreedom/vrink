<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8"/>
    <title>VRINK VRM</title>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />
    <style>
        body {
            margin: 0;
        }


    </style>
</head>

<body>


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
    const renderer = new THREE.WebGLRenderer({
        antialias: true
    });
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);
    document.body.appendChild(renderer.domElement);

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
			camera.add( lookAtTarget );


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
        `${vrm}`,

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

    		window.addEventListener( 'mousemove', ( event ) => {

				lookAtTarget.position.x = 10.0 * ( ( event.clientX - 0.5 * window.innerWidth ) / window.innerHeight );
				lookAtTarget.position.y = - 10.0 * ( ( event.clientY - 0.5 * window.innerHeight ) / window.innerHeight );

			} );
</script>
</body>
</html>