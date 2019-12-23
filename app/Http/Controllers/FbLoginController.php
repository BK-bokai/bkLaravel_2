<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Facebook;
use Validator, Redirect, Response, File;
use Socialite;
use App\Model\User;



class FbLoginController extends Controller
{
    // public function fbcallback()
    // {
    //     $app_id = '416064182386006'; // 把 {app_id} 換成你的應用程式編號
    //     $app_secret = '8c7ca4d440ae32be95d87cebba3c1ca9';  // 把 {app_secret} 換成你的應用程式密鑰
    //     $fb = new Facebook\Facebook([
    //         'app_id' => $app_id,
    //         'app_secret' => $app_secret,
    //         'default_graph_version' => 'v2.2',
    //     ]);

    //     $helper = $fb->getRedirectLoginHelper();

    //     try {
    //         $accessToken = $helper->getAccessToken();
    //     } catch (Facebook\Exceptions\FacebookResponseException $e) {
    //         // When Graph returns an error
    //         $errors = ['fbmsg' => $e->getMessage()];
    //         return view('frontend.fbcallback')->withErrors($errors);
    //         exit;
    //     } catch (Facebook\Exceptions\FacebookSDKException $e) {
    //         // When validation fails or other local issues
    //         $errors = ['fbmsg' => $e->getMessage()];
    //         return view('frontend.fbcallback')->withErrors($errors);
    //         exit;
    //     }

    //     if (!isset($accessToken)) {
    //         if ($helper->getError()) {
    //             // header('HTTP/1.0 401 Unauthorized');
    //             // echo "Error: " . $helper->getError() . "\n";
    //             // echo "Error Code: " . $helper->getErrorCode() . "\n";
    //             $errors = ['fbmsg' => $helper->getErrorReason()];
    //             return view('frontend.fbcallback')->withErrors($errors);
    //             // echo "Error Description: " . $helper->getErrorDescription() . "\n";
    //         } else {
    //             $errors = ['fbmsg' => 'HTTP/1.0 400 Bad Request'];
    //             return view('frontend.fbcallback')->withErrors($errors);
    //             // header('HTTP/1.0 400 Bad Request');
    //             // echo 'Bad request';
    //         }
    //         exit;
    //     }

    //     // Logged in
    //     // echo '<h3>Access Token</h3>';

    //     // The OAuth 2.0 client handler helps us manage access tokens
    //     $oAuth2Client = $fb->getOAuth2Client();

    //     // Get the access token metadata from /debug_token
    //     $tokenMetadata = $oAuth2Client->debugToken($accessToken);
    //     // echo '<h3>Metadata</h3>';
    //     $tokenMetadata2=var_dump($tokenMetadata);


    //     // Validation (these will throw FacebookSDKException's when they fail)
    //     $tokenMetadata->validateAppId($app_id); // Replace {app-id} with your app id
    //     // If you know the user ID this access token belongs to, you can validate it here
    //     //$tokenMetadata->validateUserId('123');
    //     $tokenMetadata->validateExpiration();

    //     if (!$accessToken->isLongLived()) {
    //         // Exchanges a short-lived access token for a long-lived one
    //         try {
    //             $accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
    //         } catch (Facebook\Exceptions\FacebookSDKException $e) {
    //             $errors = ['fbmsg' => $helper->getMessage()];
    //             return view('frontend.fbcallback')->withErrors($errors);
    //             exit;
    //         }
    //         // echo '<h3>Long-lived</h3>';
    //         $accessToken_val=var_dump($accessToken->getValue());

    //     }

    //     $_SESSION['fb_access_token'] = (string) $accessToken;

    //     // User is logged in with a long-lived access token.
    //     // You can redirect them to a members-only page.
    //     //header('Location: https://example.com/members.php');
    //     return view('frontend.fbcallback',compact('tokenMetadata2','accessToken_val'))->withErrors($errors);
    // }

    // public function fblogin()
    // {
    //     $fb = new Facebook\Facebook([
    //         'app_id' => '416064182386006', // 把 {app_id} 換成你的應用程式編號
    //         'app_secret' => '8c7ca4d440ae32be95d87cebba3c1ca9', // 把 {app_secret} 換成你的應用程式密鑰
    //         'default_graph_version' => 'v2.2',
    //     ]);

    //     $helper = $fb->getRedirectLoginHelper();

    //     $permissions = ['email'];
    //     $loginUrl = $helper->getLoginUrl('https://localhost/php/bkLaravel_2/public/fbcallback', $permissions);
    //     $Url = htmlspecialchars($loginUrl);

    //     return view('frontend.fblogin', compact('Url'));
    // }
    public function redirect($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

    public function callback($provider)
    {
        $getInfo = Socialite::driver($provider)->user();
        $user = $this->createUser($getInfo, $provider);
        auth()->login($user);
        return redirect()->route('admin.img');
        // return Redirect::to('https://localhost/php/bkLaravel_2/public/admin/img');
    }

    function createUser($getInfo, $provider)
    {
        $user = User::where('provider_id', $getInfo->id)->first();
        if (!$user) {
            $user = User::create([
                'name'     => $getInfo->name,
                'username' => $getInfo->name,
                'email'    => $getInfo->email,
                'password' => $getInfo->id,
                'active' => 'active',
                'level' => 3,
                'provider' => $provider,
                'provider_id' => $getInfo->id
            ]);
        }
        return $user;
    }
}
