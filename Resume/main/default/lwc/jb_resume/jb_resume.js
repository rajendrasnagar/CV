import { LightningElement, wire, track } from 'lwc';
import ResumeAssets from '@salesforce/resourceUrl/ResumeAssets';
import getResume from '@salesforce/apex/Jb_ResumesService.getResume';

// https://tlx-developer-edition.ap8.force.com/resume/s/rajendrasnagar
/**
 * todo: Add favicon
 * 
 */

export default class Jb_resume extends LightningElement {

    /**
     * Wire call to fetch the resume & related data
     */
    @track socials=[];
    @wire(getResume,{resumeId:'a030o00001ZgITvAAN'})
    getResumeDetails({error, data}){
        if(data){
            console.log('***Socials',data);
            data.Socials__r.forEach(rec=>{
                let imageIs;
                switch (rec.AccountType__c) {
                    case 'LinkedIn':
                        imageIs = ResumeAssets+'/Assets/Image/LinkedIn.png';
                        break;
                    case 'Medium':
                        imageIs = ResumeAssets+'/Assets/Image/Medium.png';
                        break;
                    case 'Twitter':
                        imageIs = ResumeAssets+'/Assets/Image/Twitter.png';
                        break;
                    case 'Github':
                        imageIs = ResumeAssets+'/Assets/Image/Github.png';
                        break;
                    default:
                        imageIs = ResumeAssets+'/Assets/Image/Blog.png';
                        break;
                }
                this.socials.push({
                    'accountType':rec.AccountType__c,
                    'link':rec.Link__c,
                    'Id':rec.Id,
                    imageIs,
                });
            });
            console.log('***sucess:'+JSON.stringify(this.socials));
            this.expandSocial();
        }else if(error){
            console.log('***error');
        }
    }

    renderedCallback(){
        this.template.querySelector('[data-id="navbar"]').style.background = 'URL('+ResumeAssets + '/Assets/Image/dev.jpg)';
        this.template.querySelector('[data-id="navbar"]').style.backgroundPosition = 'right';
        
        this.template.querySelector('[data-id="SocialBar"]').style.background = 'URL('+ResumeAssets + '/Assets/Image/dev.jpg)';

        this.template.querySelector('[data-id="profilePhoto').src=ResumeAssets + '/Assets/Image/0.png';
    }

    onScroll(event) {
        if (event.target.scrollTop > 80) {
            this.collapse();
            this.minimizeSocial();
        } else {
            this.expand();
            this.expandSocial();
        }

        console.log('***onScroll:');
        setTimeout(() => {
            console.log('***onScroll2:');
            this.calculatePosition();
        }, 3000);
    }   

    navigateHere(event){
        console.log('***resumes:'+event.currentTarget.dataset.id);
        console.log('***resumes:'+this.template.querySelectorAll('[data-nav="menu"'));
        let targetId = event.currentTarget.dataset.id;
        // Collapse the header
        this.collapse();

        // Update active menu
          // remove all active ones
        this.template.querySelectorAll('[data-nav="menu"').forEach(menuRec=>{
            menuRec.className="";
        });
         // add active class to current one
        this.template.querySelector(`[data-id="${targetId}"]`).className="active";
        
        if(targetId==='home'){
            this.expand();
        }else{
            // update content positioning
            this.template.querySelector('[data-id="content"]').style.marginTop='12vh';
            this.template.querySelector('[data-id="content"]').style.height='78vh';
        }
    }

    collapse(){
        // get the elements & set the classes
        this.template.querySelector('[data-id="navbar"]').style.padding = "10px 10px";
        this.template.querySelector('[data-id="logo"]').style.padding = "20px 10px";
        this.template.querySelector('[data-id="navbar"]').style.background = '';
    }

    expand(){
        // get the elements & set the classes
        this.template.querySelector('[data-id="navbar"]').style.padding = "77px 10px";
        this.template.querySelector('[data-id="navbar"]').style.fontSize = "30px";
        // update content positioning
        this.template.querySelector('[data-id="content"]').style.marginTop='30vh';
        this.template.querySelector('[data-id="content"]').style.height='60vh';
        this.template.querySelector('[data-id="navbar"]').style.background = 'URL('+ResumeAssets + '/Assets/Image/dev.jpg)';
        this.template.querySelector('[data-id="navbar"]').style.backgroundPosition = 'right';
        
    }

    minimizeSocial(){
        this.template.querySelector('[data-id="SocialBar"]').style.visibility = "hidden";
        this.template.querySelector('[data-id="SocialBar"]').style.opacity = "0";
        this.template.querySelector('[data-id="SocialBarExpand"]').style.visibility = "visible";
        this.template.querySelector('[data-id="SocialBarExpand"]').style.opacity = "1";
    }

    expandSocial(){
        this.template.querySelector('[data-id="SocialBar"]').style.visibility = "visible";
        this.template.querySelector('[data-id="SocialBar"]').style.opacity = "1";
        this.template.querySelector('[data-id="SocialBarExpand"]').style.visibility = "hidden";
        this.template.querySelector('[data-id="SocialBarExpand"]').style.opacity = "0";
    }
    calculatePosition(){
        console.log('***calculatePosition:');
        let all = this.template.querySelectorAll('[data-id="section"]');
        for (let i = 0, max = all.length; i < max; i++) {
            let an = this.isInViewport(all[i]);
            console.log('***hidden1'+an);
            console.log('***hidden2'+all[i].id);
        }
    }

    isInViewport(element) {
        const rect = element.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <= (window.innerWidth || document.documentElement.clientWidth)
        );
    }
}